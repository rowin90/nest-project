# nest demo 项目
1. 包含了 guard middleware filter decorator interceptor 基础写法
2. 代码用 nest-cli 生成，如新增 guard，使用 nest g guard xxx 。可以使用 nest g -h 看可以帮助文档


# 功能

## 权限功能（功能一）
1. 基础用法，涉及各种装饰器，guard，filter，interceptor，pipe
2. 涉及
- app.module
- bbb.module
- ccc.module

## 权限功能（功能二）
1. 涉及模块
- user 模块
  - login路由
- user
  - permission.guard 守卫
- acl-a ,acl-b 测试权限模块
- entities/db2 
- redis缓存权限内容

### 思路：
- user module 用于权限的校验，分为2个部分
    1. controller - login。用户登录成功后，用session记住当前用户状态
    2. guard - permission。守卫，获取每一次请求，在controller中对应的路由中，注入需要校验的权限 SetMetaData，在guard中查找当前用户是否具有该权限，才允许放行

### 实现
1. login,记录session
```js
@Post('login')
  async login(@Body() loginUser: LoginUserDto, @Session() session) {
    const user = await this.userService.login(loginUser);

    session.user = {
      username: user.username,
    };

    return 'success';
  }
```
2. guard。
```js
import {
  CanActivate,
  ExecutionContext,
  Inject,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { Request } from 'express';
import { Observable } from 'rxjs';
import { UserService } from './user.service';
import { Reflector } from '@nestjs/core';

@Injectable()
export class PermissionGuard implements CanActivate {
  @Inject(UserService)
  private userService: UserService;

  @Inject(Reflector)
  private reflect: Reflector;
  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request: Request = context.switchToHttp().getRequest();

    const user = request.session.user;
    if (!user) {
      throw new UnauthorizedException('用户未登录');
    }

    const foundUser = await this.userService.findByUsername(user.username);
    // 找到对应权限
    const permission = this.reflect.get('permission', context.getHandler());

    if (foundUser.permissions.some((item) => item.name === permission)) {
      return true;
    } else {
      throw new UnauthorizedException('没有权限访问接口');
    }
  }
}

```
3. 在对应的业务路由中，注入user module
- acl-a module测试的module
```js
@Module({
  imports: [UserModule],
  controllers: [AclAController],
  providers: [AclAService],
})
export class AclAModule {}

```
- acl-a controller测试路由
```js

@Controller('acl-a')
export class AclAController {
  constructor(private readonly aclAService: AclAService) {}

  @Get()
  @UseGuards(LoginGuard, PermissionGuard)
  @SetMetadata('permission', 'query_aaa')  // 注入需要的权限
  findAll() {
    return this.aclAService.findAll();
  }

  @UseGuards(LoginGuard)
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.aclAService.findOne(+id);
  }

}
```
# 构建
## 本地构建(仅业务项目)
1. docker构建。在本地用  docker build -t nest:first .
- 打镜像 nest
- 标签 first
- . 目录是当前

2. 启动，用 docker desktop 直接找到镜像，启动容器
3. 或者用命令行 docker run -p 3000:3000 -d --name nest:first nest-project

## docker-compose(业务,redis,mysql)
1. 执行 docker-compose up -d 构建
2. 所有依赖其他服务，如redis，用docker-compose启动的话，连接的host需要都改成宿主机的本地ip(参考 src/config/database.ts)，因为业务项目也是单独的容器启动的
```dockerfile
services:
  nest-app:
    build:
      context: ./
      dockerfile: ./Dockerfile
    depends_on: # 需要等待依赖服务启动
      - mysql-container
      - redis-container
    ports:
      - '5050:5050'
  mysql-container:
    image: mysql
    ports:
      - '3306:3306'
    volumes:
      - /Users/jerome/mysql:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD='guang'
  redis-container:
    image: redis
    ports:
      - '6379:6379'
    volumes:
      - /Users/jerome/redis:/data

```

import {
  Controller,
  Get,
  Inject,
  UseGuards,
  OnModuleInit,
  OnApplicationBootstrap,
  UseInterceptors,
  Param,
  ParseIntPipe,
  UseFilters,
  HttpException,
  HttpStatus,
  SetMetadata,
  Ip,
  HostParam,
  Req,
} from '@nestjs/common';
import { AppService } from './app.service';
import { BbbService } from './bbb/bbb.service';
import { CccService } from './ccc/ccc.service';
import { RoleGuard } from './guard/role.guard';
import { LoggerInterceptor } from './interceptor/logger.interceptor';
import { HttpExceptionFilter } from './filter/filter.filter';
import { Request } from 'express';
import { Auth } from './decorator/decorator.decorator';
import { CombineDesc } from './decorator/combine-desc.decorator';
import { MyHeader } from './decorator/param-desc.decorator';
import { InjectEntityManager } from '@nestjs/typeorm';
import { EntityManager } from 'typeorm';
import { User } from './entities/db1/user.module';
import { RedisClientType } from 'redis';

@Controller()
@SetMetadata('role', 'aa')
@UseGuards(RoleGuard)
export class AppController implements OnModuleInit, OnApplicationBootstrap {
  constructor(
    private readonly appService: AppService,
    @Inject('person') private readonly person: { name: string; age: number },
    @Inject('bbb') private readonly bbb: { age: number; appService: string },

    private readonly bbbService: BbbService,
    private cccService: CccService,
    @InjectEntityManager()
    private manager: EntityManager,
  ) {}

  @Inject('REDIS_CLIENT')
  private redisClient: RedisClientType;

  @UseInterceptors(LoggerInterceptor)
  @Get()
  getHello(): string {
    console.log('-> this', this.person.name);
    console.log('-> this', this.bbb.age);
    console.log('-> this', this.bbb.appService);
    console.log('-> this.bbbService.findAll()', this.bbbService.findAll());
    console.log('-> this.cssService.findAll()', this.cccService.findOne(2));

    return this.appService.getHello();
  }

  @Get('/redis')
  @Auth('admin')
  async getRedis() {
    const value = await this.redisClient.keys('*');
    return value;
  }

  @Get('/id/:id')
  @Auth('admin')
  getDetail(@Param('id', ParseIntPipe) ide: number): string {
    console.log('-> ide', ide);
    return this.appService.getHello() + 'getDetail' + ide;
  }

  @UseFilters(HttpExceptionFilter)
  @Get('/error/:id')
  @CombineDesc('admin', 'ccc')
  getDetailError(@Param('id', ParseIntPipe) ide: number): string {
    console.log('-> ide', ide);
    throw new HttpException('自定义错误', HttpStatus.BAD_REQUEST);
  }

  @Get('/list/:list')
  @SetMetadata('role', 'admin')
  getList(@Param('list') ide: number): string {
    console.log('-> ide', ide);
    return this.appService.getHello() + 'getDetail' + ide;
  }

  @Get('/findAll')
  @Auth('admin')
  findAll() {
    return this.manager.find(User);
  }

  @Get('/findOne/:id')
  @Auth('admin')
  findOne(@Param('id') id: number) {
    return this.manager.findOne(User, {
      where: { id },
    });
  }

  @Get('/ip')
  @Auth('admin')
  getIp(
    @Ip() ip,
    @HostParam('host') host,
    @Req() req: Request,
    @MyHeader('accept') header1,
  ): string {
    console.log('-> req', req.url);
    console.log('-> host', host);
    console.log('-> header1', header1);

    console.log('-> ip', ip);
    return ip;
  }

  @Get()
  onApplicationBootstrap(): any {
    console.log('-> 应用加载完成');
  }

  onModuleInit(): any {
    console.log('-> 初始化成功');
  }
}

import { Module, NestModule, MiddlewareConsumer } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { RoleGuard } from './guard/role.guard';
import { BbbModule } from './bbb/bbb.module';
import { CccModule } from './ccc/ccc.module';
import { MiMiddleware } from './middleware/mi.middleware';
import { TypeOrmModule } from '@nestjs/typeorm';
import { databaseConfig } from './config/database';
import { createClient } from 'redis';
import { UserModule } from './user/user.module';
import { AclAModule } from './acl_a/acl_a.module';
import { AclBModule } from './acl_b/acl_b.module';
console.log('databaseConfig : ', databaseConfig);

@Module({
  imports: [
    BbbModule,
    CccModule,
    // TypeOrmModule.forRoot(databaseConfig.db1),
    TypeOrmModule.forRoot(databaseConfig.db2),
    UserModule,
    AclAModule,
    AclBModule,
  ],
  controllers: [AppController],
  providers: [
    AppService,
    {
      provide: 'REDIS_CLIENT',
      async useFactory() {
        const client = createClient({
          socket: {
            host: 'localhost',
            port: 6379,
          },
        });
        await client.connect();
        return client;
      },
    },
    {
      provide: 'person',
      useFactory() {
        return { name: 1, age: 12222 };
      },
    },
    {
      provide: 'bbb',
      useFactory(person: { age: number }, appService: AppService) {
        return {
          age: person.age,
          appService: appService.getHello(),
        };
      },
      inject: ['person', AppService],
    },
    RoleGuard,
  ],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer): any {
    consumer.apply(MiMiddleware).forRoutes('*');
  }
}

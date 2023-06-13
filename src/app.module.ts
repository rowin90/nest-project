import { Module, NestModule, MiddlewareConsumer } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { RoleGuard } from './guard/role.guard';
import { BbbModule } from './bbb/bbb.module';
import { CccModule } from './ccc/ccc.module';
import { MiMiddleware } from './middleware/mi.middleware';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.module';

@Module({
  imports: [
    BbbModule,
    CccModule,
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      port: 3306,
      username: 'root',
      password: 'guang',
      database: 'typeorm_test',
      synchronize: true,
      logging: true,
      entities: [User],
      poolSize: 10,
      connectorPackage: 'mysql2',
      extra: {
        authPlugin: 'sha256_password',
      },
    }),
  ],
  controllers: [AppController],
  providers: [
    AppService,
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

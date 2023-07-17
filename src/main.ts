import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { NestExpressApplication } from '@nestjs/platform-express';
import { join } from 'path';
import * as session from 'express-session';
import { ValidationPipe } from '@nestjs/common';
import { RoleGuard } from './guard/role.guard';
import { PermissionGuard } from './user/permission.guard';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  app.useStaticAssets(join(__dirname, '..', 'public'), {
    prefix: './static',
  });
  app.use(
    session({
      secret: 'guang',
      resave: false,
      saveUninitialized: false,
    }),
  );
  app.useGlobalPipes(new ValidationPipe());
  // app.useGlobalGuards(new RoleGuard());
  // app.useGlobalGuards(new PermissionGuard());

  await app.listen(5050);
}
bootstrap();

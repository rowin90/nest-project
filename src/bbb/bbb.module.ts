import { Module } from '@nestjs/common';
import { BbbService } from './bbb.service';
import { BbbController } from './bbb.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from '../entities/db1/user.module';

@Module({
  imports: [TypeOrmModule.forFeature([User])],
  controllers: [BbbController],
  providers: [BbbService],
  exports: [BbbService],
})
export class BbbModule {}

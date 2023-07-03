import { Module } from '@nestjs/common';
import { AclAService } from './acl_a.service';
import { AclAController } from './acl_a.controller';
import { UserModule } from '../user/user.module';

@Module({
  imports: [UserModule],
  controllers: [AclAController],
  providers: [AclAService],
})
export class AclAModule {}

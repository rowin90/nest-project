import { Module } from '@nestjs/common';
import { AclBService } from './acl_b.service';
import { AclBController } from './acl_b.controller';

@Module({
  controllers: [AclBController],
  providers: [AclBService]
})
export class AclBModule {}

import { PartialType } from '@nestjs/mapped-types';
import { CreateAclBDto } from './create-acl_b.dto';

export class UpdateAclBDto extends PartialType(CreateAclBDto) {}

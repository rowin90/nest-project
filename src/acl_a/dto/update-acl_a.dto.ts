import { PartialType } from '@nestjs/mapped-types';
import { CreateAclADto } from './create-acl_a.dto';

export class UpdateAclADto extends PartialType(CreateAclADto) {}

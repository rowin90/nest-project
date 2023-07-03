import { Injectable } from '@nestjs/common';
import { CreateAclADto } from './dto/create-acl_a.dto';
import { UpdateAclADto } from './dto/update-acl_a.dto';

@Injectable()
export class AclAService {
  create(createAclADto: CreateAclADto) {
    return 'This action adds a new aclA';
  }

  findAll() {
    return `This action returns all aclA`;
  }

  findOne(id: number) {
    return `This action returns a #${id} aclA`;
  }

  update(id: number, updateAclADto: UpdateAclADto) {
    return `This action updates a #${id} aclA`;
  }

  remove(id: number) {
    return `This action removes a #${id} aclA`;
  }
}

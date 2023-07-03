import { Injectable } from '@nestjs/common';
import { CreateAclBDto } from './dto/create-acl_b.dto';
import { UpdateAclBDto } from './dto/update-acl_b.dto';

@Injectable()
export class AclBService {
  create(createAclBDto: CreateAclBDto) {
    return 'This action adds a new aclB';
  }

  findAll() {
    return `This action returns all aclB`;
  }

  findOne(id: number) {
    return `This action returns a #${id} aclB`;
  }

  update(id: number, updateAclBDto: UpdateAclBDto) {
    return `This action updates a #${id} aclB`;
  }

  remove(id: number) {
    return `This action removes a #${id} aclB`;
  }
}

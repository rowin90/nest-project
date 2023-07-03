import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  SetMetadata,
} from '@nestjs/common';
import { AclAService } from './acl_a.service';
import { CreateAclADto } from './dto/create-acl_a.dto';
import { UpdateAclADto } from './dto/update-acl_a.dto';
import { LoginGuard } from '../guard/login.guard';
import { PermissionGuard } from '../user/permission.guard';

@Controller('acl-a')
export class AclAController {
  constructor(private readonly aclAService: AclAService) {}

  @Post()
  create(@Body() createAclADto: CreateAclADto) {
    return this.aclAService.create(createAclADto);
  }

  @Get()
  @UseGuards(LoginGuard, PermissionGuard)
  @SetMetadata('permission', 'query_aaa')
  findAll() {
    return this.aclAService.findAll();
  }

  @UseGuards(LoginGuard)
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.aclAService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateAclADto: UpdateAclADto) {
    return this.aclAService.update(+id, updateAclADto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.aclAService.remove(+id);
  }
}

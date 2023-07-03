import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
} from '@nestjs/common';
import { AclBService } from './acl_b.service';
import { CreateAclBDto } from './dto/create-acl_b.dto';
import { UpdateAclBDto } from './dto/update-acl_b.dto';
import { LoginGuard } from '../guard/login.guard';

@Controller('acl-b')
export class AclBController {
  constructor(private readonly aclBService: AclBService) {}

  @Post()
  create(@Body() createAclBDto: CreateAclBDto) {
    return this.aclBService.create(createAclBDto);
  }

  @Get()
  @UseGuards(LoginGuard)
  findAll() {
    return this.aclBService.findAll();
  }

  @Get(':id')
  @UseGuards(LoginGuard)
  findOne(@Param('id') id: string) {
    return this.aclBService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateAclBDto: UpdateAclBDto) {
    return this.aclBService.update(+id, updateAclBDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.aclBService.remove(+id);
  }
}

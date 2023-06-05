import { applyDecorators, SetMetadata } from '@nestjs/common';
import { Auth } from './decorator.decorator';

export const CombineDesc = (auth: string, bbb: string) => {
  return applyDecorators(SetMetadata('combine-desc', bbb), Auth(auth));
};

import { TestBed } from '@angular/core/testing';
import { curriculosService } from './curriculo.service';

describe('curriculosService', () => {
  let service: curriculosService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(curriculosService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

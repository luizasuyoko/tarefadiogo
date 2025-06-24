import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CurriculosListComponent } from './curriculo-list.component';

describe('CurriculosListComponent', () => {
  let component: CurriculosListComponent;
  let fixture: ComponentFixture<CurriculosListComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CurriculosListComponent]
    });
    fixture = TestBed.createComponent(CurriculosListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

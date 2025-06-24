import { Component, OnInit } from '@angular/core';
import { Curriculo } from 'src/app/models/curriculo.mode';
import { curriculosService } from 'src/app/services/curriculo.service';

@Component({
  selector: 'app-curriculos',
  templateUrl: './curriculos.component.html',
  styleUrls: ['./curriculos.component.scss']
})
export class CurriculosComponent implements OnInit{
  public curriculos: Curriculo[] = [];

  constructor(private _curriculosService: curriculosService){}

  ngOnInit(): void {
    this.listarCurriculos();
  }

  
  listarCurriculos(){
    this._curriculosService.getCurriculo().subscribe( //
      (e) => { //listar vaga por vaga dentro do vetor
        this.curriculos = e.map(
          (curriculo) => {
            return Curriculo.fromMap(curriculo);
          }
        );
      }
    )
  }
}

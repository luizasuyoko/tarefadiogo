import { Component, OnInit } from '@angular/core';
import { Vaga } from 'src/app/models/vaga.model';
import { VagasService } from 'src/app/services/vagas.service';

@Component({
  selector: 'app-vagas',
  templateUrl: './vagas.component.html',
  styleUrls: ['./vagas.component.scss']
})

//controller -> view -> model
export class VagasComponent implements OnInit {
  public vagas: Vaga[] = []; //vetor para armazenar as vagas do bd

  constructor(private _VagasService: VagasService){
    //injeta o servico de vagas dentro do componente
  }

  ngOnInit(): void{
    this.listarVagas();
  }

  //função para listar vagas 
  listarVagas(){
    this._VagasService.getVaga().subscribe( //
      (e) => { //listar vaga por vaga dentro do vetor
        this.vagas = e.map(
          (vaga) => {
            return Vaga.fromMap(vaga);
          }
        );
      }
    )
  }
}

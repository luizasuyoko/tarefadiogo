import { Component } from '@angular/core';
import { Vaga } from 'src/app/models/vaga.model';
import { VagasService } from 'src/app/services/vagas.service';

@Component({
  selector: 'app-painel-vagas',
  templateUrl: './painel-vagas.component.html',
  styleUrls: ['./painel-vagas.component.scss']
})
export class PainelVagasComponent {
  //atributos
  public vaga: Vaga = new Vaga(0, "","","",0);
  //rastrear os dados no formulario por interpolação
  public vagas: Vaga[] = []; //vetor para armazenar as vagas do bd

  //construtor
  constructor(private _vagaService: VagasService){}
  //aplicando o servico no construtor

  //método onInit
  ngOnInit(): void {
    this.listarVagas();
  }
  

  //5 metodos para o crud
  //listar vags
  listarVagas(): void{
    this._vagaService.getVaga().subscribe(
      (e) => {
        this.vagas = e.map(
          (vaga)=> Vaga.fromMap(vaga)
        );
      }, (error) => {
        console.error("Erro ao Listar Vagas: ",error);
      }
    );
  }

  //listar vaga por id 
  listarVagaPorId(vaga:Vaga): void{
    //metodo para listar uma vaga no formulário para edição
    this.vaga = vaga;
    //a vaga clicada é definida como a vaga atual do formmulario
  }

  //create
  cadastrarVaga(): void{
    this._vagaService.postVaga(this.vaga).subscribe(
      () => {
        this.vaga = new Vaga(0, "","","", 0);
        this.listarVagas();
      }, (error) => {console.error("Erro ao Cadastrar Vaga: ", error)}
    );
  }

  //update
  atualizarVaga(id:any): void{
    this._vagaService.putVaga(id, this.vaga).subscribe(
      () => {
        this.vaga = new Vaga(0, '','','',0); //limpa formulario
        this.listarVagas(); //lista as vagas novamente
      }, (error) => {console.error('Erro ao atualizar Vaga: ', error);
      }
    )
  }

  //delete
  excluirVagas(id:any): void{
    this._vagaService.deleteVagas(id).subscribe(
      () => {
        this.vaga = new Vaga(0,'','','',0); 
        this.listarVagas();
      }, (error) => {
        console.error('Erro ao Deletar Vaga: ', error)
      }
    )
  }
}

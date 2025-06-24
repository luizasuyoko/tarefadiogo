import { Component, OnInit } from '@angular/core';
import { Curriculo } from 'src/app/models/curriculo.mode';
import { curriculosService } from 'src/app/services/curriculo.service';

@Component({
  selector: 'app-curriculos-list',
  templateUrl: './curriculo-list.component.html',
  styleUrls: ['./curriculo-list.component.scss']
})

export class CurriculosListComponent implements OnInit{
  termoBusca: string = '';
  resultados: Curriculo[] = [];
  buscou: boolean = false;

  private todosCurriculos: Curriculo[] = [];

  constructor(private curriculoService: curriculosService) {}

  ngOnInit(): void {
    // Carrega todos os currículos uma vez
    this.curriculoService.getCurriculo().subscribe(
      (dados) => {
        this.todosCurriculos = dados.map((c) => Curriculo.fromMap(c));
      },
      () => {
        alert('Erro ao carregar currículos');
      }
    );
  }

  buscar(): void {
    this.resultados = [];
    this.buscou = true;

    const termo = this.termoBusca.trim().toLowerCase();

    if (!termo) return;

    // Verifica se é número (ID)
    if (!isNaN(Number(termo))) {
      const id = Number(termo);
      this.curriculoService.getCurriculoById(id).subscribe(
        (curriculo) => {
          this.resultados = [Curriculo.fromMap(curriculo)];
        },
        () => {
          this.resultados = [];
        }
      );
    } else {
      // Busca por nome (case insensitive)
      this.resultados = this.todosCurriculos.filter((curriculo) =>
        curriculo.nome.toLowerCase().includes(termo)
      );
    }
  }
}

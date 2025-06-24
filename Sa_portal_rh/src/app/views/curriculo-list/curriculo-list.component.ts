import { Component, OnInit } from '@angular/core';
import { Curriculo } from 'src/app/models/curriculo.mode';
import { curriculosService } from 'src/app/services/curriculo.service';

@Component({
  selector: 'app-curriculos-list',
  templateUrl: './curriculo-list.component.html',
  styleUrls: ['./curriculo-list.component.scss']
})

export class CurriculosListComponent implements OnInit{
   curriculos: Curriculo[] = [];
  filtroId = '';

  constructor(private curriculosService: curriculosService) {}

  ngOnInit(): void {
    this.curriculosService.getCurriculo().subscribe({
      next: (dados) => (this.curriculos = dados),
      error: (erro) => console.error('Erro ao buscar currículos:', erro),
    });
  }

  get curriculosFiltrados(): Curriculo[] {
    return this.curriculos.filter(c => {
      const idOk = this.filtroId === '' || c.id.toString().includes(this.filtroId);
      return idOk;
    });
  }}

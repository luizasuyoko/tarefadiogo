import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './views/home/home.component';
import { VagasComponent } from './views/vagas/vagas.component';
import { CurriculoFormComponent } from './views/curriculo-form/curriculo-form.component';
import { CurriculosComponent } from './views/curriculos/curriculos.component';
import { PainelVagasComponent } from './views/painel-vagas/painel-vagas.component';
import { CurriculosListComponent } from './views/curriculo-list/curriculo-list.component';

//crio as rotas de navegacao
const routes: Routes = [
  {path: "", component: HomeComponent},
  {path: "vagas", component: VagasComponent},
  {path: "curriculos", component: CurriculosComponent},
  {path: "painel-vagas", component: PainelVagasComponent},
  {path: "curriculo-form", component: CurriculoFormComponent},
  {path: "curriculo-list", component: CurriculosListComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

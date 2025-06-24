import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from 'rxjs';
import { Vaga } from '../models/vaga.model';

@Injectable({
  providedIn: 'root'
})
export class VagasService {
  private apiUrl = "http://localhost:3008/vagas"; //endereceo da api

  constructor(private http: HttpClient) { }

  //criar os metodos para conexao com apiRest

  //get - obter a lista de vagas
  getVaga(): Observable<Vaga[]>{ //observable -> rxjs => tradutor de json -> typescript
    return this.http.get<Vaga[]>(this.apiUrl);
  }

  //post 
  postVaga(vaga:Vaga): Observable<Vaga[]>{//metodo pata enviar dados paar api
    return this.http.post<Vaga[]>(this.apiUrl,vaga);
    //observable -> rxjs => tradutor de json -> typescript
  }

  //put
  //nomeDoMetodos(parametros)
  putVaga(id: any, vaga:Vaga): Observable<Vaga[]>{//coleção chave -> valor
    const url = this.apiUrl+"/"+id; //construir a url join (apiurl+id)
    return this.http.put<Vaga[]>(url, vaga);
  }

  //delete
  deleteVagas(id: any): Observable<Vaga[]>{
    const url = this.apiUrl+"/"+id;
    return this.http.delete<Vaga[]>(url)
  }
}

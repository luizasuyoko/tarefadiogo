import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Curriculo } from '../models/curriculo.mode';

@Injectable({
  providedIn: 'root'
})
export class curriculosService{
    private apiUrl = "http://localhost:3008/curriculos"

    constructor(private http: HttpClient) { }
    // getCurriculo
    getCurriculo(): Observable<Curriculo[]>{
        return this.http.get<Curriculo[]>(this.apiUrl);
    }
    //getCurriculoById
    getCurriculoById(id: any): Observable<Curriculo[]>{
      const url = this.apiUrl + "/" + id; //construir a url join (apiurl+id)
      return this.http.get<Curriculo[]>(url);
    }
    //post 
    postCurriculo(curriculo:Curriculo): Observable<Curriculo[]>{//metodo pata enviar dados paar api
      return this.http.post<Curriculo[]>(this.apiUrl,curriculo);
      //observable -> rxjs => tradutor de json -> typescript
    }
    
    //put
    //nomeDoMetodos(parametros)
    putCurriculo(id: any, curriculo:Curriculo): Observable<Curriculo[]>{//coleção chave -> valor
      const url = this.apiUrl+"/"+id; //construir a url join (apiurl+id)
      return this.http.put<Curriculo[]>(url, curriculo);
    }
    
    //delete
    deleteCurriculo(id: any): Observable<Curriculo[]>{
      const url = this.apiUrl+"/"+id;
      return this.http.delete<Curriculo[]>(url)
    }
    
}
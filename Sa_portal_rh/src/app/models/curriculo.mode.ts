export class Curriculo {
    constructor(
        public id: number,
        public nome: string,
        public formacao: string,
        public experiencia: string,
        public telefone: string,
        public email: string,
    ) {}
    // Métodos de conversao de objetos
    //obj => Json
    public toMap():{[key:string]:any}{
        return {
            id: this.id,
            nome: this.nome,
            formacao: this.formacao,
            experiencia: this.experiencia,
            telefone: this.telefone,
            email: this.email,
        }
    }
    //Json => obj
    static fromMap(map:any): Curriculo{
        return new Curriculo(
            map.id,
            map.nome,
            map.formacao,
            map.experiencia,
            map.telefone,
            map.email,
        )
    }
}
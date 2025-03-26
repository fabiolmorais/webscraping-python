<template>
  <div class="container">
    <h1>Buscar Operadoras</h1>
    <input
      type="text"
      v-model="searchInput"
      placeholder="Digite a modalidade..."
      @input="debouncedSearch"
    />
    <ul v-if="operadoras.length">
      <li v-for="operadora in operadoras" :key="operadora.Registro_ANS">
        {{ operadora.Nome_Fantasia }} - {{ operadora.Modalidade }}
      </li>
    </ul>
    <p v-else>Nenhuma operadora encontrada.</p>
  </div>
</template>

<script>
import axios from "axios";
import { debounce } from "lodash"; // Importando lodash para debounce

export default {
  data() {
    return {
      searchInput: "",
      operadoras: [],
    };
  },
  created() {
    // Criar a versão debounce da função de busca
    this.debouncedSearch = debounce(this.search, 500);
  },
  methods: {
    async search() {
      const modalidade = this.searchInput.trim();
      if (modalidade.length < 2) {
        console.log("A modalidade é muito curta.");
        this.operadoras = [];
        return;
      }

      const url = `http://localhost:8000/operadoras?search=${encodeURIComponent(modalidade)}`;
      console.log("URL chamada:", url);

      try {
        const response = await axios.get(url);
        this.operadoras = response.data;
      } catch (error) {
        console.error("Erro ao buscar operadoras:", error);
        this.operadoras = [];
      }
    }
  }
};
</script>

<style scoped>
.container {
  max-width: 600px;
  margin: auto;
  text-align: center;
}
input {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  background: #f4f4f4;
  margin: 5px 0;
  padding: 10px;
  border-radius: 5px;
}
</style>

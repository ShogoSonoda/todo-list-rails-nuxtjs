<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="8" md="6">
      <div class="text-center">
        <logo/>
        <vuetify-logo/>
        <v-btn @click="getApi()">GET API</v-btn>
        <div>{{ message }}</div>
      </div>
    </v-col>
  </v-row>
</template>

<script>
import Logo from '~/components/NuxtLogo.vue'
import VuetifyLogo from '~/components/VuetifyLogo.vue'

export default {
  components: {
    Logo,
    VuetifyLogo
  },
  data: () => {
    return {
      message: ''
    }
  },
  methods: {
    getApi(){
      const url = "/api/v1/posts"
      this.$axios.get(url)
      .then((res) => {
        this.message = res.data
      })
      .catch((error) => {
        console.log(error)
      })
    }
  }
}
</script>

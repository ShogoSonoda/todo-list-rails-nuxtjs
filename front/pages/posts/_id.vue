<template>
  <div class="container py-5">
    <b-card>
      <b-card-text>
        詳細画面
      </b-card-text>
      <b-button
        size="sm"
        @click="toTop()"
      >
        Topへ
      </b-button>
    </b-card>
  </div>
</template>

<script>
export default {
  toTop() {
    this.$router.push('/posts')
  },
}
</script>

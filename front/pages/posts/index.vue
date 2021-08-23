<template>
  <div class="container py-5">
    <b-card
      v-for="post in posts"
      :key="post.id"
    >
    <b-card-text>
      {{ post.content }}
    </b-card-text>
    </b-card>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      posts: [],
    }
  },

  mounted() {
    this.fetchContents()
  },

  methods: {
    fetchContents() {
      const url = "/api/v1/posts"
      this.$axios.get(url)
        .then((res) => {
          console.log(res)
        })
        .catch(() => {

        })
    },
  }
}
</script>

<style>

</style>

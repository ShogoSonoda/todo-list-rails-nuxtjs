<template>
  <div class="container py-5">
    <b-card>
      <b-card-text>
        {{ post.content }}
      </b-card-text>
      <b-button
        size="sm"
        @click="toTop()"
      >
        Topへ
      </b-button>
      <b-button
        size="sm"
        variant="success"
        @click="openModal()"
      >
        編集
      </b-button>
    </b-card>

    <b-modal
      hide-header
      hide-footer
      id="edit-modal"
    >
    <b-form-textarea
      v-model="content"
    >
    </b-form-textarea>
    <b-button
      class="mt-3"
      variant="primary"
      :disabled="disabled"
      @click="update()"
    >
      更新
    </b-button>
    </b-modal>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      content: '',
      post: {},
    }
  },

  mounted() {
    this.fetchContent()
  },

  methods: {
    fetchContent() {
      const url = `/api/v1/posts/${this.$route.params.id}`
      this.$axios.get(url)
        .then((res) => {
          this.post = res.data.post
        })
        .catch(() => {
          this.toTop()
        })
    },
    toTop() {
      this.$router.push('/posts')
    },
    openModal() {
      this.content = this.post.content
      this.$bvModal.show('edit-modal')
    }
  }
}
</script>

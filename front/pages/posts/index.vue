<template>
  <div class="container py-5 position-relative">
    <b-card
      v-for="post in posts"
      :key="post.id"
    >
      <b-card-text>
        {{ post.content }}
      </b-card-text>
    </b-card>

    <b-button
      v-b-modal.new-modal
      class="position-absolute mt-4 action-btn"
      pill
      variant="primary"
      size="lg"
    >
      +
    </b-button>

    <b-modal
      hide-header
      hide-footer
      id="new-modal"
    >
      <b-form-textarea
        v-model="content"
        autofocus
      />
      <b-button
        class="mt-3"
        variant="primary"
        :disabled="disabled"
        @click="save()"
      >
      保存
      </b-button>
    </b-modal>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      posts: [],
      content: '',
    }
  },

  mounted() {
    this.fetchContents()
  },

  computed: {
    disabled() {
      return this.content.length === 0
    },

    params() {
      return {
        post: {
          content: this.content
        }
      }
    }
  },

  methods: {
    fetchContents() {
      const url = "/api/v1/posts"
      this.$axios.get(url)
        .then((res) => {
          this.posts = res.data.posts
        })
    },

    save() {
      const url = "/api/v1/posts"
      this.$axios.post(url, this.params)
        .then((res) => {
          console.log(res)
          this.$bvModal.hide('new-modal')
          this.content = ''
          this.fetchContents()
          this.$bvToast.toast(res.data, {
            title: '成功',
            variant: 'success'
          })
        })
        .catch((err) => {
          const message = err.response.data
          this.$bvToast.toast(message, {
            title: 'エラー',
            variant: 'danger'
          })
        })
    }
  }
}
</script>

<style scoped>
.action-btn {
  right: 16px;
}
</style>

<template>
  <v-container grid-list-xs>
    <v-subheader>
      <h2>热门话题</h2>
    </v-subheader>
    <v-layout row wrap>
      <v-flex
        v-for="topic in topics"
        :key="topic.id"
        xs12
        md3
        class="mb-5"
      >
        <v-card class="mx-3">
          <v-card-media
            :src="topic.img_url | urlFilter"
            height="200px"
          >
            <v-container
              fill-height
              class="bg-gradient"
            >
              <v-layout fill-height>
                <v-flex>
                  <router-link :to="goto('TopicDetail', topic.id)" class="headline white--text">{{ topic.name }}</router-link>
                </v-flex>
              </v-layout>
            </v-container>
          </v-card-media>
          <v-card-title primary-titles>
            <div class="topic--detail">
              <p>{{ topic.detail }}</p>
            </div>
          </v-card-title>
          <v-card-actions>
            <v-btn color="primary">参与</v-btn>
            <span class="grey--text">{{ topic.join_count }} 人参与</span>
          </v-card-actions>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  computed: mapGetters({
    topics: 'allTopics'
  }),
  created () {
    if (!this.topics) {
      this.$store.dispatch('getAllTopics')
    }
  },
  methods: {
    goto (name, id) {
      return {
        name,
        params: {
          id
        }
      }
    }
  }
}
</script>

<style scoped>
.topic--detail {
  height: 40px;
  overflow: hidden;
}

.topic--detail > p {
  /* white-space: nowrap; */
  overflow: hidden;
  text-overflow: ellipsis;
}

.bg-gradient {
  background-color: rgba(0, 0, 0, .2);
}
</style>


<template>
  <v-layout row wrap>
    <v-flex xs12 v-if="!currents.length">
      <v-card>
        <v-card-title>
          还没没有任何人参与该话题！<router-link :to="goto('CurrentCreate')">马上参与</router-link>该话题
        </v-card-title>
      </v-card>
    </v-flex>
    <v-flex xs12>
      <v-card
        v-for="current in currents"
        :key="current.id"
      >
        <v-card-title>
          <v-avatar size="42">
            <img :src="current.user.avatar_url | urlFilter" :alt="current.user.name">
          </v-avatar>
          <span class="px-3">{{ current.user.name }}</span>
          <span>发表于 {{ current.created_at | dateFilter }}</span>
        </v-card-title>
        <v-card-text>
          <h1>{{ current.title }}</h1>
          <section>
            <p>{{ current.text }}</p>
          </section>
        </v-card-text>
        <v-card-actions>
          <v-btn flat small color="grey" icon>
            <v-icon small>favorite</v-icon>
          </v-btn>
          <span>{{ current.star_count }}</span>
          <v-btn flat small color="grey" icon>
            <v-icon small>thumb_up</v-icon>
          </v-btn>
          <span>{{ current.praise_count }}</span>
        </v-card-actions>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
import goto from '@/utils/goto'

export default {
  props: {
    currents: {
      type: Array,
      default: () => []
    }
  },
  methods: {
    goto
  }
}
</script>

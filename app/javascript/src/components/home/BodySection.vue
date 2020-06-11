<template>
  <v-container fluid class="pa-0">
    <v-row no-gutters>
      <v-col cols="12" class="background-image">
        <div class="background-image--text text-center">
          <h1 class="display-3 font-weight-bold" v-html="$t('home.headerSection.title')"></h1>
          <div class="mt-12 find-artist">

          </div>
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  export default {
    name: 'HeaderSection',
    data: () => {
      return {
        initialRender: true
      }
    },
    methods: {
      linkToEntries(scope) {
        this.$router.push({ name: 'entries', params: { scopeType: scope } })
      },
      showTextArea() {
        this.initialRender = false
      }
    }
  }
</script>

<style lang="scss" scoped>
  .background-image {
    position: relative;

    &--text {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: white;

      .display-3 {
        line-height: 4.20rem;
      }
    }
  }
</style>

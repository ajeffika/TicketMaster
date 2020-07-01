<template>
  <v-container fluid class="pt-5">
    <v-row no-gutters>
      <v-col cols="12" class="background-image">
        <div class="background-image--text text-center">
          <div class="mt-12 submit-ticket">
            <v-btn
              x-large
              raised
              tile
              dark
              @click="linkToTicketSubmit()">
              {{$t('home.headerSection.submitIncident')}}
            </v-btn>
          </div>
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  export default {
    name: 'BodySection',
    data: () => {
      return {
        initialRender: true
      }
    },
    methods: {
      linkToTicketSubmit() {
        this.$router.push({ name: 'newIncident' })
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

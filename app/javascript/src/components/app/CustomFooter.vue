<template>
  <v-footer app  tile padless>
    <v-card class="flex footer-card" flat tile>
      <v-container fluid>
        <v-row>
          <v-col cols="12" md="6" class="hidden-md-and-down">
            <div class="headline text-center text-md-left ml-md-4">{{$t('app.footer.title')}}</div>
          </v-col>

          <v-col cols="12" md="6" class="text-center text-md-right">
            <v-btn v-for="icon in icons" :key="icon" class="mx-4" icon color="secondary">
              <v-icon size="24px">{{ icon }}</v-icon>
            </v-btn>
          </v-col>
        </v-row>

        <v-card-text class="py-2 text-center black--text">
          {{ new Date().getFullYear() }} — <strong class="black--text">Jan Mistarz</strong>
        </v-card-text>
      </v-container>
    </v-card>
  </v-footer>
</template>

<script>
  export default {
    name: 'CustomFooter',
    data() {
      return {
        icons: [
          'mdi-facebook',
          'mdi-twitter',
          'mdi-google-plus',
          'mdi-linkedin',
          'mdi-instagram'
        ]
      }
    }
  }
</script>

<style lang="scss" scoped>
  .footer-card {
    background: #FBFF4A;
    color: black;
  }
</style>

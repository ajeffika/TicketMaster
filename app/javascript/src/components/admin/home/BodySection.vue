<template>
  <v-container fluid class="pa-0">
    <v-row no-gutters>
      <v-col cols="12" class="background-image">
        <div class="text-center">
          <h1 class="display-3 font-weight-bold title-color" v-html="$t('admin.home.title')"></h1>
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>

<style lang="scss" scoped>
  .title-color {
    color: white !important;
  }

</style>

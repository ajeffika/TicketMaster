<template>
  <div>
    <v-btn
      rounded
      class="white--text font-weight-bold px-6"
      color="black"
      :to="{name: 'adminIncidentList'}"
    >
      {{$t('app.appBar.incidentList')}}
    </v-btn>
    <v-btn
      rounded
      class="white--text font-weight-bold px-6"
      color="black"
      :to="{name: 'adminUserList'}"
    >
      {{$t('app.appBar.userList')}}
    </v-btn>
  </div>

</template>

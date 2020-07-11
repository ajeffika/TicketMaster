<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12" md="6" offset-md="3">
        <user-info-tab></user-info-tab>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  import UserInfoTab from '@components/userProfile/tabs/UserInfoTab';

  export default {
    name: 'UserProfileView',
    components: {UserInfoTab},
    data() {
      return {
        tab: 'info',
      };
    },
  };
</script>
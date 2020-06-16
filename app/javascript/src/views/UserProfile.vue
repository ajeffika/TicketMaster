<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12" md="6" offset-md="3">
        <v-tabs
          v-model="tab"
          icons-and-text
          centered
          color="white"
          grow
        >
          <v-tab href="#info">
            {{$t('userProfile.tabs.profile')}}
            <v-icon>mdi-account</v-icon>
          </v-tab>

          <v-tab href="#band">
            {{$t('userProfile.tabs.band')}}
            <v-icon>mdi-account-group</v-icon>
          </v-tab>

          <v-tabs-slider></v-tabs-slider>
        </v-tabs>

        <v-tabs-items v-model="tab">
          <v-tab-item value="info">
            <user-info-tab></user-info-tab>
          </v-tab-item>
          <v-tab-item value="band">
          </v-tab-item>
        </v-tabs-items>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  import UserInfoTab from '@components/userProfile/tabs/UserInfoTab';

  export default {
    name: 'UserProfileView',
    components: { UserInfoTab },
    data() {
      return {
        tab: 'info',
      };
    },
  };
</script>
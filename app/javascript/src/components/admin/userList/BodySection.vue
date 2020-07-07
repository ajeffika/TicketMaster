<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12" md="6" offset-md="3">
        <v-card dark class="pa-6">
          <v-container fluid class=" rounded-corner">
            <h1>
              {{$t('user.usersList.title')}}
              <div class="float-right">
                {{users.length}}/{{users.length}}
              </div>
            </h1>
            <div v-if="users.length > 0" class="mt-3">
              <expansion-users-list :users="users"/>
            </div>
          </v-container>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>HomePager

<script>
  import ExpansionUsersList from '@components/admin/userList/ExpansionUsersList';
  import {mapActions, mapGetters} from 'vuex';
  import {FETCH_USERS} from "../../../store/modules/user/action-types";

  export default {
    name: 'MyIncidents',
    components: {ExpansionUsersList},
    created() {
      this.fetchUsers()
    },
    computed: {
      ...mapGetters({
        users: 'user/list',
      }),
    },
    methods: {
      ...mapActions({
        fetchUsers: `user/${FETCH_USERS}`,
      }),
    },
  };
</script>
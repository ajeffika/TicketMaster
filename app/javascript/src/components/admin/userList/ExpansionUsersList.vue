<template>
  <v-expansion-panels focusable popout light>
    <v-expansion-panel v-for="user in users" :key="user.id">
      <expansion-users-list-element :users="user"></expansion-users-list-element>
    </v-expansion-panel>
  </v-expansion-panels>
</template>

<script>
  import ExpansionUsersListElement from '@components/admin/userList/ExpansionUsersListElement';

  export default {
    name: 'ExpansionUsersList',
    components: { ExpansionUsersListElement },
    props: ['users'],
  };
</script>
<template>
  <div>
    <v-expansion-panel-header>
      <template v-slot:default="{ open }">
        <div class="subtitle-1" v-text="user.username"></div>
      </template>
    </v-expansion-panel-header>

    <v-expansion-panel-content>
      <div class="mt-5 mb-5">
        <v-simple-table>
          <template>
            <tbody>
            <tr>
              <td>{{ $t('user.list.username') }}</td>
              <td>{{ user.username }}</td>
            </tr>
            <tr>
              <td>{{ $t('user.list.email') }}</td>
              <td>{{ user.email }}</td>
            </tr>
            <tr>
              <td>{{ $t('user.list.firstName') }}</td>
              <td>{{ user.firstName }}</td>
            </tr>
            <tr>
              <td>{{ $t('user.list.lastName') }}</td>
              <td>{{ user.lastName }}</td>
            </tr>
            <tr>
              <td>{{ $t('user.list.role') }}</td>
              <td>{{ user.role}}</td>
            </tr>
            </tbody>
          </template>
            <v-btn
              rounded
              class="white--text font-weight-bold px-6"
              color="black"
              :to="{name: 'adminUserForm', params: {userId: user.id}}"
            >
              {{$t('user.list.editUser')}}
            </v-btn>
        </v-simple-table>

      </div>
    </v-expansion-panel-content>

  </div>
</template>

<script>

  export default {
    name: 'ExpansionIncidentsListElement',
    components: {},
    props: ['user'],
  };
</script>

<style lang="scss">
  .incident-form-border {
    box-shadow: 0 2px 9px 0 rgb(255, 255, 255);
  }

  .pre-line-description {
    white-space: pre-line
  }
</style>
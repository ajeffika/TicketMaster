<template>
  <v-card-text class="pb-4">
    <form>
      <v-text-field
        v-model="user.email"
        v-validate="'required'"
        :error-messages="errors.collect('email')"
        :label="$t('user.form.email')"
        data-vv-name="email"
        :data-vv-as="$t('user.form.email')"
        color="dark"
        required
      ></v-text-field>
      <v-text-field
        v-model="user.username"
        v-validate="'required'"
        :error-messages="errors.collect('username')"
        :label="$t('user.form.username')"
        data-vv-name="username"
        :data-vv-as="$t('user.form.username')"
        color="dark"
        required
      ></v-text-field>
      <v-text-field
        v-model="user.firstName"
        v-validate="'required'"
        :error-messages="errors.collect('firstName')"
        :label="$t('user.form.firstName')"
        data-vv-name="firstName"
        :data-vv-as="$t('user.form.firstName')"
        color="dark"
        required
      ></v-text-field>
      <v-text-field
        v-model="user.lastName"
        v-validate="'required'"
        :error-messages="errors.collect('lastName')"
        :label="$t('user.form.lastName')"
        data-vv-name="lastName"
        :data-vv-as="$t('user.form.lastName')"
        color="dark"
        required
      ></v-text-field>
      <v-text-field
        v-model="user.role"
        v-validate="'required'"
        :error-messages="errors.collect('role')"
        :label="$t('user.form.role')"
        data-vv-name="role"
        :data-vv-as="$t('user.form.role')"
        color="dark"
        required
      ></v-text-field>

    </form>
    <v-card-actions class="mt-3">
      <v-spacer/>
      <v-btn color="success" @click="submit">
        {{$t('user.form.submit')}}
      </v-btn>
    </v-card-actions>
  </v-card-text>
</template>

<script>
  import {mapActions, mapGetters} from 'vuex'
  import {UPDATE_USER} from '@/store/modules/user/action-types'

  export default {
    name: 'UserForm',
    props: ['user'],
    $_veeValidate: {
      validator: 'new'
    },
    data() {
      return {
        params: {
          editable: false,
          editableUser: {},
        },
        userFields: [
          {name: 'firstName', validations: 'required|min:3'},
          {name: 'lastName', validations: 'required|min:3'},
          {name: 'username', validations: 'required|min:3|unique:user-username'},
          {name: 'email', validations: 'required|email|'},
          {name: 'role', validations: 'required|email|'},
          {name: 'email', validations: 'required|email|'},
        ],
      };
    },
    methods: {
      ...mapActions({
        editUser: `user/${UPDATE_USER}`,
      }),
      submit() {
        this.$validator.validateAll().then(result => {
          if (result) {
            this.$emit('submitAction')
            this.$router.push('admin_user_list');
          }
        })
      }
    },
  };
</script>

<style>
  .overlay {
    backdrop-filter: blur(20px);
    opacity: 0.5;
  }
</style>
<template>
  <v-card dark class="mt-5 rounded-corner" >
    <v-container>
      <v-col class="text-center mt-5" offset-md="3" cols="6" md="6">
        <v-avatar size="15em">
          <v-img :src="require('@/assets/images/user_avatar.png')"></v-img>
        </v-avatar>
        <v-row class="display-1">
          <v-col cols="12" md="12" class="text-center">{{fullName}}</v-col>
          <v-col cols="12" class="text-center">
            <profile-editable-button
              :user="user"
              :params="params"
            ></profile-editable-button>
          </v-col>
        </v-row>

        <v-col cols="12" md="12">
          <user-input
            v-for="userField in userFields"
            :key="userField.name"
            :editable="params.editable"
            :user="params.editableUser"
            :userField="userField"
          ></user-input>
        </v-col>
      </v-col>

    </v-container>
  </v-card>
</template>

<script>
  import UserInput from '@components/userProfile/tabs/userInfoTab/UserInput';
  import ProfileEditableButton from '@components/userProfile/tabs/userInfoTab/ProfileEditableButton';
  import {UPDATE_USER} from '@/store/modules/auth/action-types';
  import {mapGetters, mapActions} from 'vuex';

  export default {
    name: 'UserInfoTab',
    components: {UserInput, ProfileEditableButton},
    $_veeValidate: {
      validator: 'new',
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
        ],
      };
    },
    created() {
      this.params.editableUser = Object.assign({}, this.user);
    },
    computed: {
      ...mapGetters({
        user: 'auth/user',
      }),

      fullName() {
        return `${this.params.editableUser.firstName} ${this.params.editableUser.lastName}`;
      },
    },
    methods: {
      ...mapActions({
        editUser: `auth/${UPDATE_USER}`,
      }),
    },
  };
</script>

<style>
  .rounded-corner {
    border-radius: 20px !important;
  }
</style>
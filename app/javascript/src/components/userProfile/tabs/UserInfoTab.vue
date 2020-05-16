<template>
  <v-card class="mt-5">
    <v-container>
      <v-col class="text-left mt-5" cols="12" md="12">
        <v-avatar size="15em">
          <img src="https://avatars0.githubusercontent.com/u/9064066?v=4&s=460">
        </v-avatar>
        <v-row class="display-1">
          <v-col cols="10" md="6">{{fullName}}</v-col>
          <v-col cols="2" offset-md="4">
            <profile-editable-button
              :user="user"
              :params="params"
            ></profile-editable-button>
          </v-col>
        </v-row>
      </v-col>

      <v-col cols="12" md="6">
        <user-input
          v-for="userField in userFields"
          :key="userField.name"
          :editable="params.editable"
          :user="params.editableUser"
          :userField="userField"
        ></user-input>
      </v-col>
    </v-container>
  </v-card>
</template>

<script>
  import UserInput from '@components/userProfile/tabs/userInfoTab/UserInput';
  import ProfileEditableButton from '@components/userProfile/tabs/userInfoTab/ProfileEditableButton';
  import { UPDATE_USER } from '@/store/modules/auth/action-types';
  import { mapGetters, mapActions } from 'vuex';

  export default {
    name: 'UserInfoTab',
    components: { UserInput, ProfileEditableButton },
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
          { name: 'firstName', validations: 'required|min:3' },
          { name: 'lastName', validations: 'required|min:3' },
          { name: 'username', validations: 'required|min:3|unique:user-username' },
          { name: 'email', validations: 'required|email|unique:user-email' },
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

      // acceptChanges() {
      //   this.$validator.validate().then(valid => {
      //     if (valid) {
      //       console.log('no chyba nie');
      //       // this.editUser(this.params.editableUser).then(() => {
      //       //   this.toggleEditable();
      //       // });
      //     }
      //   });
      // },
    },
  };
</script>
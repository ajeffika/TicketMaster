<template>
  <v-btn v-if="!params.editable" text dark class="mt-2 mr-1 float-right" @click="toggleEditable()">
    <span class="hidden-sm-and-down">{{$t('userProfile.profile.edit')}}</span>
    <v-icon dark>edit</v-icon>
  </v-btn>
  <div v-else class="d-flex justify-space-around mt-2">
    <v-btn icon @click="cancelEdit()">
      <v-icon>cancel</v-icon>
    </v-btn>
    <v-btn icon @click="acceptChanges()">
      <v-icon>done</v-icon>
    </v-btn>
  </div>
</template>

<script>
  import { mapActions } from 'vuex';
  import { UPDATE_USER } from '@/store/modules/auth/action-types';

  export default {
    name: 'ProfileEditableButton',
    props: ['params', 'user'],
    inject: ['$validator'],
    methods: {
      ...mapActions({
        editUser: `auth/${UPDATE_USER}`,
      }),
      toggleEditable() {
        this.params.editable = !this.params.editable;
      },
      acceptChanges() {
        this.$validator.validate().then(valid => {
          if (valid) {
            this.editUser(this.params.editableUser).then(() => {
              this.toggleEditable();
            });
          }
        });
      },
      cancelEdit() {
        this.toggleEditable();
        this.params.editableUser = Object.assign({}, this.user);
      },
    },
  };
</script>
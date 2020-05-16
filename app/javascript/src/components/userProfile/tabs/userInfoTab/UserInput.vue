<template>
  <div>
    <v-text-field
      v-if="editable"
      v-model="user[userField.name]"
      v-validate="userField.validations"
      :label="fieldName"
      :error-messages="errors.collect(userField.name)"
      :data-vv-name="userField.name"
      :data-vv-as="fieldName"
      color="secondary"
    >
    </v-text-field>

    <div v-else-if="isPasswordField">
      <v-row>
        <v-col cols="6" md="4">
          {{fieldName}}:
        </v-col>
        <v-col cols="6" md="8">
          {{user[userField.name]}}
        </v-col>
      </v-row>
    </div>
  </div>
</template>

<script>
  export default {
    inject: ['$validator'],
    name: 'UserInput',
    props: ['userField', 'user', 'editable'],
    computed: {
      fieldName() {
        return this.$i18n.t(`userProfile.profile.${this.userField.name}`);
      },
      isPasswordField() {
        return this.userField.name !== 'password';
      },
    },
  };
</script>

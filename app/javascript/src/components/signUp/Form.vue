<template>
  <div class="mt-5">
    <form>
      <v-text-field
        v-model="user.firstName"
        v-validate="'required|min:3'"
        :error-messages="errors.collect('firstName')"
        :label="$t('auth.form.firstName')"
        data-vv-name="firstName"
        :data-vv-as="$t('auth.form.firstName')"
        required
        color="dark"
        outlined
        shaped
      ></v-text-field>
      <v-text-field
        v-model="user.lastName"
        v-validate="'required|min:3'"
        :error-messages="errors.collect('lastName')"
        :label="$t('auth.form.lastName')"
        data-vv-name="lastName"
        :data-vv-as="$t('auth.form.lastName')"
        required
        color="dark"
        outlined
        shaped
      ></v-text-field>
      <v-text-field
        v-model="user.username"
        v-validate="'required|min:3|unique:user-username'"
        :error-messages="errors.collect('username')"
        :label="$t('auth.form.username')"
        data-vv-name="username"
        :data-vv-as="$t('auth.form.username')"
        required
        color="dark"
        outlined
        shaped
      ></v-text-field>
      <v-text-field
        v-model="user.email"
        v-validate="'required|email|unique:user-email'"
        :error-messages="errors.collect('email')"
        :label="$t('auth.form.email')"
        data-vv-name="email"
        :data-vv-as="$t('auth.form.email')"
        required
        outlined
        shaped
        color="dark"
      ></v-text-field>
      <v-text-field
        v-model="user.password"
        v-validate="'required|min:6'"
        :error-messages="errors.collect('password')"
        :label="$t('auth.form.password')"
        data-vv-name="password"
        :data-vv-as="$t('auth.form.password')"
        type="password"
        required
        outlined
        shaped
        color="dark"
      ></v-text-field>
      <v-checkbox
        v-model="user.termsAndConditions"
        v-validate="'required'"
        :error-messages="errors.collect('termsAndConditions')"
        :label="$t('auth.form.termsAndConditions')"
        data-vv-name="termsAndConditions"
        :data-vv-as="$t('auth.form.termsAndConditions')"
        type="checkbox"
        required
        class="mt-0"
      ></v-checkbox>
    </form>
    <div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'SignUpForm',
    props: ['user'],
    $_veeValidate: {
      validator: 'new',
    },
    methods: {
      submit() {
        this.$validator.validate().then(valid => {
          if (valid) {
            this.$emit('submit');
          }
        });
      },
    },
  };
</script>
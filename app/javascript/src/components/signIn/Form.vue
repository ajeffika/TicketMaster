<template>
  <div class="mt-5">
    <form>
      <v-text-field
        v-model="user.email"
        v-validate="'required|email'"
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
    </form>
    <div>
      <v-btn width="250px" large rounded color="primary black--text" @click="submit">
        {{$t('auth.form.signIn')}}
      </v-btn>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'SignInForm',
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
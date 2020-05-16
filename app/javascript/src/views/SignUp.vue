<template>
  <transition appear name="slide-fade">
    <v-row no-gutters>
      <v-col cols="12" md="5" offset-md="1" class="px-3 pt-5 pt-md-0 px-md-0">
        <div class="form-wrapper text-center">
          <div class="d-flex justify-space-between">
            <v-btn tile outlined color="secondary" class="form-wrapper--button mb-5" @click="goHome">
              {{$t('global.custom.goHome')}}
              <v-icon>mdi-home</v-icon>
            </v-btn>
            <v-btn title outlined color="secondary" class="mb-5" @click="goToSignIn">
              {{$t('global.custom.signIn')}}
              <v-icon>mdi-arrow-right</v-icon>
            </v-btn>
          </div>
          <div class="form-wrapper--content pb-5 pb-md-0 mt-5 mt-md-0">
            <div class="display-3">{{$t('auth.form.signUp')}}</div>
            <div class="mt-5">{{$t('auth.form.signUpDescription')}}</div>
            <div class="d-flex justify-md-center justify-space-between my-5">
              <div class="mx-md-8" v-for="socialButton in socialButtons" :key="socialButton.name">
                <v-btn class="mx-2" fab large light :color="socialButton.color">
                  <v-icon color="white">{{socialButton.icon}}</v-icon>
                </v-btn>
              </div>
            </div>
            <div class="hr-line-with-icon mt-3">
              <div class="hr-line-with-icon--line"></div>
              <div class="hr-line-with-icon--content">
                <div>{{$t('global.custom.or')}}</div>
              </div>
              <div class="hr-line-with-icon--line"></div>
            </div>

            <sign-up-form :user="user" @submit="submit"/>
          </div>
        </div>
      </v-col>
      <v-col cols="5" offset-md="1" class="hidden-sm-and-down background-image">
        <v-img
          height="100vh"
          gradient="to top right, rgba(100,115,201,.33), rgba(25,32,72,.7)"
        ></v-img>
        <div class="background-image--text white--text pa-sm-3 pa-md-0">
          <div class="display-3" v-html="$t('auth.signUp.joinUsTitle')"></div>
          <div class="heading">{{$t('auth.signUp.joinUsDescription')}}</div>
        </div>
      </v-col>
    </v-row>
  </transition>
</template>

<script>
  import { mapActions } from 'vuex';
  import { SIGN_UP } from '@/store/modules/auth/action-types';
  import SignUpForm from '../components/signUp/Form';

  export default {
    name: 'SignUpView',
    components: { SignUpForm },
    data: () => {
      return {
        user: {
          firstName: '',
          lastName: '',
          termsAndConditions: false,
          email: '',
          password: '',
        },
        socialButtonStructure: [
          { name: 'facebook', icon: 'mdi-facebook-box', color: '#5a75c3' },
          { name: 'twitter', icon: 'mdi-twitter', color: '#1DA1F2' },
          { name: 'google', icon: 'mdi-google', color: '#DD4B39' },
        ],
      };
    },
    computed: {
      socialButtons() {
        return this.socialButtonStructure.map(button => {
          return Object.assign(button, { name: this.$i18n.t(`global.socialButtons.${button.name}`) });
        });
      },
    },
    methods: {
      ...mapActions({
        signUp: `auth/${SIGN_UP}`,
      }),
      submit() {
        this.signUp(this.user);
      },
      goHome() {
        this.$router.push({ name: 'home' });
      },
      goToSignIn() {
        this.$router.push({ name: 'signIn' });
      },
    },
  };
</script>

<style lang="scss" scoped>
  .form-wrapper {
    flex-direction: column;
    justify-content: center;
    display: flex;
    height: 100%;

    &--content {
      width: 100%;
    }

    &--button {
      align-self: flex-end;
    }
  }

  .background-image {
    box-shadow: 0 2px 9px 0 #730E15;
    position: relative;

    &--text {
      position: absolute;
      top: 45%;
      left: 50%;
      transform: translate(-50%, -50%);

      .display-3 {
        line-height: 4.20rem;
      }
    }
  }

  .hr-line-with-icon {
    display: flex;

    &--line {
      width: 100%;
      position: relative;
      margin: 7px;
      border-bottom: 1px solid #000;
    }

    &--content {
      position: relative;
      top: 3px;
    }
  }

  .slide-fade-enter-active {
    transition: all 2s ease;
  }

  .slide-fade-enter, .slide-fade-leave-to {
    transform: translateX(20px);
    opacity: 0.5;
  }
</style>

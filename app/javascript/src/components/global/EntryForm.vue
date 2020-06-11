<template>
  <v-card-text>
    <form>
      <v-text-field
        v-model="entry.title"
        v-validate="'required'"
        :error-messages="errors.collect('title')"
        :label="$t('entry.form.title')"
        data-vv-name="title"
        :data-vv-as="$t('entry.form.city')"
        color="dark"
        required
      ></v-text-field>
      <v-select
        v-model="entry.scopeType"
        v-validate="'required'"
        :items="scopeTypeItems"
        :error-messages="errors.collect('scopeType')"
        :label="$t('entry.form.scopeType')"
        data-vv-name="scopeType"
        :data-vv-as="$t('entry.form.scopeType')"
        color="dark"
        item-text="name"
        item-value="value"
        item-color="secondary"
      ></v-select>
      <v-select
        v-model="entry.categoryIds"
        v-validate="'required'"
        :items="musicCategories"
        :error-messages="errors.collect('musicCategories')"
        :label="$t('entry.form.musicCategories')"
        data-vv-name="musicCategories"
        :data-vv-as="$t('entry.form.musicCategories')"
        color="dark"
        item-text="name"
        item-value="id"
        item-color="secondary"
        multiple
        chips
        deletable-chips
      ></v-select>
      <v-text-field
        v-model="entry.phone"
        v-validate="'min:9|numeric'"
        :error-messages="errors.collect('phone')"
        :label="$t('entry.form.phone')"
        data-vv-name="phone"
        :data-vv-as="$t('entry.form.phone')"
        color="dark"
      ></v-text-field>
      <v-text-field
        v-model="entry.city"
        v-validate="'required'"
        :error-messages="errors.collect('city')"
        :label="$t('entry.form.city')"
        data-vv-name="city"
        :data-vv-as="$t('entry.form.city')"
        color="dark"
        required
      ></v-text-field>
      <v-textarea
        rows="2"
        auto-grow
        v-model="entry.description"
        v-validate="'required'"
        :error-messages="errors.collect('description')"
        :label="$t('entry.form.description')"
        data-vv-name="description"
        :data-vv-as="$t('entry.form.description')"
        color="dark"
        required
      ></v-textarea>
    </form>
    <v-card-actions class="mt-3">
      <v-spacer />
      <v-btn color="success" @click="submit">
        {{translatedSubmit}}
      </v-btn>
    </v-card-actions>
  </v-card-text>
</template>

<script>
  import { mapActions, mapGetters } from 'vuex'
  import { FETCH_MUSIC_CATEGORIES } from '@/store/modules/category/action-types'

  export default {
    name: 'EntryForm',
    props: ['entry'],
    $_veeValidate: {
      validator: 'new'
    },
    data: () => ({
      scopeTypeItems: [
        { name: 'Muzyk', value: 'musician' },
        { name: 'Zespół', value: 'band' }
      ]
    }),
    computed: {
      ...mapGetters({
        musicCategories: 'category/musicCategories',
      }),

      translatedSubmit() {
        if (this.entry.id) {
          return this.$i18n.t('entry.form.updateEntry')
        } else {
          return this.$i18n.t('entry.form.saveEntry')
        }
      }
    },
    methods: {
      ...mapActions({
        fetchMusicCategories: `category/${FETCH_MUSIC_CATEGORIES}`,
      }),
      submit() {
        this.$validator.validateAll().then(result => {
          if (result) {
            this.$emit('submitAction')
          }
        })
      }
    }
  }
</script>

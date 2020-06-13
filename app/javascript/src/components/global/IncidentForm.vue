<template>
  <v-card-text>
    <form>
      <v-text-field
        v-model="incident.title"
        :items="title"
        v-validate="'required'"
        :error-messages="errors.collect('title')"
        :label="$t('entry.form.title')"
        data-vv-name="title"
        :data-vv-as="$t('entry.form.city')"
        color="dark"
        required
      ></v-text-field>
      <v-select
        v-model="incident.description"
        v-validate="'required'"
        :items="description"
        :error-messages="errors.collect('description')"
        :label="$t('entry.form.scopeType')"
        data-vv-name="scopeType"
        :data-vv-as="$t('entry.form.scopeType')"
        color="dark"
        item-text="name"
        item-value="value"
        item-color="secondary"
      ></v-select>
      <v-select
        v-model="incident.categoryId"
        v-validate="'required'"
        :items="categoryId"
        :error-messages="errors.collect('attachment')"
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
        v-model="incident.userId"
        :items="userId"
        v-validate="'min:9|numeric'"
        :error-messages="errors.collect('category')"
        :label="$t('entry.form.phone')"
        data-vv-name="phone"
        :data-vv-as="$t('entry.form.phone')"
        color="dark"
      ></v-text-field>
      <v-text-field
        v-model="incident.attachment"
        :items="attachment"
        v-validate="'required'"
        :error-messages="errors.collect('city')"
        :label="$t('entry.form.city')"
        data-vv-name="city"
        :data-vv-as="$t('entry.form.city')"
        color="dark"
        required
      ></v-text-field>
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
  import { FETCH_INCIDENT_CATEGORIES } from '@/store/modules/category/action-types'

  export default {
    name: 'IncidentForm',
    props: ['incident'],
    $_veeValidate: {
      validator: 'new'
    },
    computed: {
      ...mapGetters({
        incidentCategories: 'category/categories',
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
        fetchCategories: `category/${FETCH_INCIDENT_CATEGORIES}`,
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

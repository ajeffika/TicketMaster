<template>
  <v-card-text>
    <form>
      <v-text-field
        v-model="incident.title"
        v-validate="'required'"
        :error-messages="errors.collect('title')"
        :label="$t('incident.form.title')"
        data-vv-name="title"
        :data-vv-as="$t('incident.form.title')"
        color="dark"
        required
      ></v-text-field>
      <v-text-field
        v-model="incident.description"
        v-validate="'required'"
        :error-messages="errors.collect('description')"
        :label="$t('incident.form.description')"
        data-vv-name="description"
        :data-vv-as="$t('incident.form.scopeType')"
        color="dark"
        item-text="name"
        item-value="value"
        item-color="secondary"
      ></v-text-field>
      <v-text-field
        v-model="incident.categoryId"
        v-validate="'required'"
        :error-messages="errors.collect('categoryId')"
        :label="$t('incident.form.categoryId')"
        data-vv-name="categoryId"
        :data-vv-as="$t('incident.form.categoryId')"
        color="dark"
        item-text="name"
        item-value="id"
        item-color="secondary"
        multiple
        chips
        deletable-chips
      ></v-text-field>
      <v-text-field
        v-model="incident.userId"
        v-validate="'min:9|numeric'"
        :error-messages="errors.collect('userId')"
        :label="$t('incident.form.userId')"
        data-vv-name="userId"
        :data-vv-as="$t('incident.form.userId')"
        color="dark"
      ></v-text-field>
      <v-text-field
        v-model="incident.attachment"
        v-validate="'required'"
        :error-messages="errors.collect('attachment')"
        :label="$t('incident.form.attachment')"
        data-vv-name="attachment"
        :data-vv-as="$t('incident.form.attachment')"
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
        if (this.incident.id) {
          return this.$i18n.t('incident.form.updateIncident')
        } else {
          return this.$i18n.t('incident.form.saveIncident')
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

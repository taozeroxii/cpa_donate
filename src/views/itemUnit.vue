<template>
  <v-container id="itemlist">
    <!-- Table section -->
    <v-card style="margin:15px">
      <v-data-table :search="search" :headers="headers" :items="mDataArray"  :loading="loaddata" loading-text="Loading... Please wait">
        <!-- table top section -->
        <template v-slot:top>
          <v-toolbar flat color="white">
            <v-toolbar-title>ข้อมูลประเภทหน่วยนับ</v-toolbar-title>
            <v-divider class="mx-4" inset vertical></v-divider>
            <v-text-field
              v-model="search"
              append-icon="search"
              label="Search"
              single-line
              hide-details
            ></v-text-field>
            <v-spacer></v-spacer>
            <v-btn
              @click="$router.push('/add-item-unit')"
              color="primary"
              dark
              class="mb-2"
            >
              <v-icon left>add</v-icon>
              <span>เพิ่มประเภทหน่วยนับ</span>
            </v-btn>
          </v-toolbar>
        </template>

        <!-- table tr section -->
        <template v-slot:item="{ item }">
          <tr>
            <td>{{ item.item_type_id }}</td>
            <td>{{ item.item_name_type }}</td>
            <td>{{ item.note }}</td>
            <td>{{ item.insertdatetime|date }}</td>
            <!-- <td>{{ item.price | currency("฿") }}</td>
            <td>{{ item.stock | number("0,0") }} pcs.</td> -->
            <td>
              <v-icon class="mr-2" @click="editItem(item)">
                edit
              </v-icon>
              <span class="ma-1"></span>
              <v-icon @click="deleteItem(item)">
                delete
              </v-icon>
            </td>
          </tr>
        </template>
      </v-data-table>

      <v-dialog v-model="confirmDeleteDlg" max-width="290">
        <v-card>
          <v-card-title primary-title>
            Confirm Delete
          </v-card-title>

          <v-card-text class="body">
           ยังไม่เปิดให้ใช้งาน
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn text @click="confirmDeleteDlg = false">
              ยกเลิก
            </v-btn>

            <!-- <v-btn color="error" text @click="confirmDelete">
              ยืนยัน
            </v-btn> -->
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-card>
  </v-container>
</template>

<script>
import axios from 'axios'

export default {
  name: "itemlist",
  components:{
    
  },

  data() {
    return {
      search: "",
      selectedUserId: "",
      confirmDeleteDlg: false,
      loaddata:true,
      mDataArray: [],
      headers: [
        {
          text: "Id",
          sortable: false,
          align: "left",
          value: "item_type_id",
        },
        { text: "ชื่อรายการ", value: "item_name_type" },
        { text: "หมายเหตุ", value: "note" },
        { text: "วันที่เพิ่ม", value: "insertdatetime" },
        { text: "Action", value: "action" },
      ],
    };
  },


  methods: {
    editItem(item) {
      // console.log(item.item_type_id);
      this.$router.push(`/edit-item-unit/${item.item_type_id}`);
    },
    deleteItem(item) {
        this.selectedUserId = item.item_type_id;
        this.confirmDeleteDlg = true;
        console.log('เลือกลบ id: ' +this.selectedUserId )
    },
    async confirmDelete() {
        // console.log(this.selectedUserId)
        // await axios.delete(`api/account/delete-donatein/${this.selectedUserId}`);
        // this.confirmDeleteDlg = false;
        // this.loadItemlist();
    },
    async loadItemlist() {
        await axios.get(`api/typeinput/itemtype` ).then((result) => { this.mDataArray = result.data;});
        this.loaddata = false;
    },
  },

  mounted() {
      this.loadItemlist();
  },
};
</script>

<style></style>

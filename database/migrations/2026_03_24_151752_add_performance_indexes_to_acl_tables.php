<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('acl_admin_actions', function (Blueprint $table) {
            $table->index('function_name');
        });

        Schema::table('user_permission_actions', function (Blueprint $table) {
            $table->index(['user_id', 'is_active'], 'upa_user_active_idx');
            $table->index('admin_module_action_id');
        });

        Schema::table('acls', function (Blueprint $table) {
            $table->index(['parent_id', 'is_active']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('acl_admin_actions', function (Blueprint $table) {
            $table->dropIndex(['function_name']);
        });

        Schema::table('user_permission_actions', function (Blueprint $table) {
            $table->dropIndex('upa_user_active_idx');
            $table->dropIndex(['admin_module_action_id']);
        });

        Schema::table('acls', function (Blueprint $table) {
            $table->dropIndex(['parent_id', 'is_active']);
        });
    }
};
